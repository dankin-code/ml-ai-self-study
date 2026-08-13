import numpy as np                                      # For array manipulation
import tensorflow as tf                                 # TensorFlow framework
from tensorflow.keras.applications.resnet50 import ResNet50, preprocess_input, decode_predictions  # Pre-trained model and utilities
from lime import lime_image                             # LIME for explainable AI
from skimage.segmentation import mark_boundaries        # For visualization of segments
import matplotlib.pyplot as plt                         # For plotting images
from PIL import Image                                   # For image handling
import logging                                          # For console logging
import argparse                                         # For command-line arguments

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# Parse command-line arguments
def parse_args():
    parser = argparse.ArgumentParser(description='Predict image class using ResNet50')
    parser.add_argument('--image', type=str, default='dog1.png',
                        help='Path to the image file (default: dog1.png)')
    parser.add_argument('--lime_analyze', action='store_true',
                        help='Run LIME analysis on the prediction')
    return parser.parse_args()

args = parse_args()

logger.info('Loading pre-trained ResNet50 model with ImageNet weights...')
model = ResNet50(weights='imagenet') # Load the pre-trained ResNet50 model with ImageNet weights
logger.info('Model loaded successfully')

# Open and display the target image
logger.info(f'Opening image file {args.image}... What is it, do you think?')
try:
    img = Image.open(args.image)
    logger.info(f'Image opened successfully. Size: {img.size}, Mode: {img.mode}')
    plt.imshow(img)
    plt.show()
except Exception as e:
    logger.error(f'Error opening image: {e}')

# Preprocess the image for the model
logger.info('Preprocessing image for model input...')
img_array = np.array(img.resize((224, 224)))           # Resize to 224x224 (required input size for ResNet50)
logger.info(f'Image resized to 224x224. Array shape: {img_array.shape}')
x = preprocess_input(np.expand_dims(img_array, axis=0)) # Add batch dimension and preprocess for ResNet50
logger.info(f'Input tensor shape after preprocessing: {x.shape}')

# Make a prediction using the model
logger.info('Making prediction with ResNet50 model...')
preds = model.predict(x)
logger.info(f'Prediction complete. Output shape: {preds.shape}, Top probability: {np.max(preds):.4f}')

# Decode the prediction to human-readable format
logger.info('Decoding prediction to human-readable format...')
# decode_predictions converts the output to class labels from ImageNet
# [0][0] gets the top prediction for the first image
prediction = decode_predictions(preds, top=1)[0][0]
logger.info(f'Decoded prediction - ID: {prediction[0]}, Class: {prediction[1]}, Confidence: {prediction[2]:.4f}')

# Display the prediction class and confidence score
result_msg = f"Prediction: {prediction[1]}, Confidence: {prediction[2]:.2f}"
print(result_msg)
logger.info(f'Final result: {result_msg}')

# Run LIME analysis if requested
if args.lime_analyze:
    logger.info('Running LIME analysis...')
    
    explainer = lime_image.LimeImageExplainer()
    
    def model_predict(images):
        images = np.array([preprocess_input(img.copy()) for img in images])
        return model.predict(images)
    
    logger.info('Generating LIME explanation (this may take a moment)...')
    explanation = explainer.explain_instance(
        img_array, 
        model_predict, 
        top_labels=1, 
        hide_color=0, 
        num_samples=1000
    )
    
    temp, mask = explanation.get_image_and_mask(
        explanation.top_labels[0], 
        positive_only=True, 
        num_features=5, 
        hide_rest=False
    )
    
    logger.info('Displaying LIME visualization...')
    plt.figure(figsize=(10, 5))
    plt.subplot(1, 2, 1)
    plt.imshow(img)
    plt.title(f"Original: {prediction[1]}")
    
    plt.subplot(1, 2, 2)
    plt.imshow(mark_boundaries(temp, mask))
    plt.title("LIME Explanation")
    plt.show()
    logger.info('LIME analysis complete')
else:
    logger.info('LIME analysis skipped (use --lime_analyze flag to enable)')