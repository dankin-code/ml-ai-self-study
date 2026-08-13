explainer = lime_image.LimeImageExplainer()

def model_predict(images):
    images = np.array([preprocess_input(img.copy()) for img in images])
    return model.predict(images)
    
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

plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.imshow(img)
plt.title(f"Original: {prediction[1]}")

plt.subplot(1, 2, 2)
plt.imshow(mark_boundaries(temp, mask))
plt.title("LIME Explanation")
plt.show()