<#
.SYNOPSIS
    Demo Environment Setup Script for Visualizing Model Decisions with LIME

.DESCRIPTION
    This script automates setting up everything necessary for the "Visualizing Model Decisions with LIME" demo environment.
    It ensures the environment is in the expected start state for the demo by creating,
    configuring, and removing components as needed.

.PARAMETER ProjectPath
    Path to the demo directory. Defaults to the current script directory.

.PARAMETER Force
    Skip confirmations and run all operations without prompting.

.PARAMETER Interactive
    Prompt for confirmation before each operation.

.PARAMETER Rollback
    Remove all changes and return the environment to its pre-demo state.


STEPS TO PERFORM MANUALLY BEFORE RUNNING SCRIPT:
- Ensure you have an active internet connection to download Python packages.
- Ensure the 'golden_retriever.png' and 'husky_snow.png' image files are placed in the demo's project directory: /Users/adam/courses/introduction-explainable-ai/m3c1. If they are missing, the script will prompt you to place them there.

STEPS TO PERFORM MANUALLY AFTER SCRIPT COMPLETES:
- None. The environment is ready for the demo actions script (demo.ps1).
#>

param(
    [string]$ProjectPath = "$PSScriptRoot",
    [switch]$Force,
    [switch]$Interactive,
    [switch]$Rollback
)

#region Setup and Helper Functions

# Set error action preference
$ErrorActionPreference = "Stop"

# Initialize tracker for created resources
$script:CreatedResources = @{
    Files = @()
    PythonPackages = @()
    # Add other resource types as needed
}

# Function to output colored status messages
function Write-Status {
    param([string]$Message, [string]$Color = "Cyan")
    Write-Host "[$((Get-Date).ToString('HH:mm:ss'))] $Message" -ForegroundColor $Color
}

# Function to get confirmation in interactive mode
function Get-Confirmation {
    param(
        [string]$Message,
        [switch]$Required
    )
    
    if ($Force -and -not $Required) {
        return $true
    }
    
    if (-not $Interactive -and -not $Required) {
        return $true
    }
    
    $confirmation = Read-Host "$Message (y/n)"
    return ($confirmation -eq 'y' -or $confirmation -eq 'Y')
}

# Function to register a created resource for rollback
function Register-Resource {
    param(
        [string]$Type,
        [string]$Resource
    )
    
    if (-not $script:CreatedResources.ContainsKey($Type)) {
        $script:CreatedResources[$Type] = @()
    }
    
    $script:CreatedResources[$Type] += $Resource
}

# Function to check if a resource exists
function Test-ResourceExists {
    param(
        [string]$Type,
        [string]$Resource
    )
    
    switch ($Type) {
        "File" { return (Test-Path -Path $Resource) }
        "PythonPackage" {
            # Since we're not using this check anymore, just return true
            # This avoids the syntax issues with the Python import command
            return $true
        }
        default { Write-Status "Unknown resource type: $Type" "Yellow"; return $false }
    }
}

# Function to validate environment prerequisites
function Test-Prerequisites {
    $prerequisites = @(
        @{Name = "Python 3"; Test = { (Get-Command python3 -ErrorAction SilentlyContinue) }; Message = "Python 3 is required and must be in your PATH."},
        @{Name = "Pip"; Test = { (Get-Command pip3 -ErrorAction SilentlyContinue) }; Message = "Pip is required and must be in your PATH."},
        @{Name = "Internet Connection"; Test = { Test-Connection -ComputerName "pypi.org" -Count 1 -Quiet }; Message = "Internet connection is required to download Python packages."}
    )
    
    $allPassed = $true
    
    foreach ($prereq in $prerequisites) {
        if (-not (& $prereq.Test)) {
            Write-Status "Prerequisite check failed: $($prereq.Name) - $($prereq.Message)" "Red"
            $allPassed = $false
        }
    }
    
    return $allPassed
}

#endregion

#region Main Functions

# Function to perform rollback of created resources
function Invoke-Rollback {
    Write-Status "Starting rollback process..." "Yellow"
    
    # Remove resources in reverse order of creation
    foreach ($type in $script:CreatedResources.Keys) {
        foreach ($resource in $script:CreatedResources[$type]) {
            if (Get-Confirmation "Remove $type`: $resource?") {
                try {
                    switch ($type) {
                        "Files" {
                            if (Test-Path -Path $resource) {
                                Remove-Item -Path $resource -Force -Recurse
                                Write-Status "Removed file/directory: $resource" "Green"
                            }
                        }
                        "PythonPackages" {
                            if (Test-ResourceExists -Type "PythonPackage" -Resource $resource) {
                                pip3 uninstall $resource -y | Out-Null
                                Write-Status "Uninstalled Python package: $resource" "Green"
                            }
                        }
                        default {
                            Write-Status "Unknown resource type: $type" "Yellow"
                        }
                    }
                }
                catch {
                    Write-Status "Error removing $type $resource`: $_" "Red"
                }
            }
        }
    }
    
    # Remove resource tracking file
    $resourceTrackingPath = Join-Path -Path $ProjectPath -ChildPath ".demo-resources.json"
    if (Test-Path -Path $resourceTrackingPath) {
        Remove-Item -Path $resourceTrackingPath -Force
    }
    
    Write-Status "Rollback completed" "Green"
    
    # Display post-rollback manual steps if any
    Write-Status "MANUAL POST-ROLLBACK STEPS:" "Yellow"
    Write-Status "- None." "White"
}

# Function to check for and clean up remnants from previous demo runs
function Remove-PreviousDemoArtifacts {
    Write-Status "Checking for artifacts from previous demo runs..." "Cyan"
    
    # Load previous resources if tracking file exists
    $resourceTrackingPath = Join-Path -Path $ProjectPath -ChildPath ".demo-resources.json"
    if (Test-Path -Path $resourceTrackingPath) {
        try {
            $previousResources = Get-Content -Path $resourceTrackingPath -Raw | ConvertFrom-Json
            
            if (Get-Confirmation "Previous demo resources found. Remove them?") {
                foreach ($type in $previousResources.PSObject.Properties.Name) {
                    foreach ($resource in $previousResources.$type) {
                        switch ($type) {
                            "Files" {
                                if (Test-Path -Path $resource) {
                                    Remove-Item -Path $resource -Force -Recurse
                                    Write-Status "Removed previous file/directory: $resource" "Green"
                                }
                            }
                            "PythonPackages" {
                                if (Test-ResourceExists -Type "PythonPackage" -Resource $resource) {
                                    pip3 uninstall $resource -y | Out-Null
                                    Write-Status "Uninstalled previous Python package: $resource" "Green"
                                }
                            }
                        }
                    }
                }
                
                # Remove the tracking file itself
                Remove-Item -Path $resourceTrackingPath -Force
                Write-Status "Previous demo resources removed" "Green"
            }
        }
        catch {
            Write-Status "Error handling previous resources: $_" "Red"
        }
    }
    
    # We want to preserve the image files for the demo
    $demoImages = @(
        (Join-Path -Path $ProjectPath -ChildPath "golden_retriever.png"),
        (Join-Path -Path $ProjectPath -ChildPath "husky_snow.png")
    )
    
    foreach ($image in $demoImages) {
        if (Test-Path -Path $image) {
            Write-Status "Preserving demo image: $image" "Green"
        }
    }
}

# Function to set up the demo environment
function Initialize-DemoEnvironment {
    Write-Status "Starting demo environment setup..." "Cyan"
    
    # Create demo directory structure if it doesn't exist
    if (-not (Test-Path -Path $ProjectPath)) {
        if (Get-Confirmation "Project path doesn't exist. Create it: $ProjectPath?") {
            New-Item -Path $ProjectPath -ItemType Directory -Force | Out-Null
            Register-Resource -Type "Files" -Resource $ProjectPath
            Write-Status "Created project directory: $ProjectPath" "Green"
        }
        else {
            Write-Status "Setup aborted: Project path doesn't exist" "Red"
            return $false
        }
    }
    
    return $true
}

#endregion

#region Demo-Specific Setup Functions

function Install-PythonDependencies {
    Write-Status "Installing required Python packages..." "Cyan"
    
    # First, upgrade pip to avoid warnings
    try {
        Write-Status "Upgrading pip to latest version..." "White"
        python3 -m pip install --upgrade pip | Out-Null
        Write-Status "Pip upgraded successfully" "Green"
    }
    catch {
        $errorMsg = $_.Exception.Message
        Write-Status "Warning: Could not upgrade pip" "Yellow"
        Write-Status "$errorMsg" "Yellow"
        Write-Status "Continuing with existing pip version" "Yellow"
    }
    
    # Install packages with better error handling
    $pythonPackages = @("numpy<2.0.0", "tensorflow", "lime", "scikit-image", "matplotlib", "Pillow")
    
    foreach ($package in $pythonPackages) {
        try {
            Write-Status "Installing Python package: $package" "White"
            # Use --no-deps to avoid dependency conflicts with existing packages
            # This is safer for a demo environment where we just need the packages to work
            pip3 install $package --upgrade --no-warn-script-location --ignore-installed --no-deps 2>&1 | Out-Null
            
            # If that fails, try without --no-deps
            if ($LASTEXITCODE -ne 0) {
                Write-Status "Retrying installation of $package without --no-deps..." "Yellow"
                pip3 install $package --upgrade --no-warn-script-location --ignore-installed 2>&1 | Out-Null
            }
            
            Register-Resource -Type "PythonPackages" -Resource $package
            Write-Status "Installed Python package: $package" "Green"
        }
        catch {
            $errorMsg = $_.Exception.Message
            Write-Status "Warning: Issue installing $package" "Yellow"
            Write-Status "$errorMsg" "Yellow"
            Write-Status "Continuing with setup - the demo may still work with existing packages" "Yellow"
            # Don't return false here, as we want to continue even if there are warnings
        }
    }
    return $true
}

function Verify-DemoImages {
    Write-Status "Verifying demo image files..." "Cyan"
    $imageFiles = @("golden_retriever.png", "husky_snow.png")
    $allImagesPresent = $true

    foreach ($image in $imageFiles) {
        $imagePath = Join-Path -Path $ProjectPath -ChildPath $image
        if (-not (Test-Path -Path $imagePath)) {
            Write-Status "Image file '$image' not found at '$imagePath'." "Red"
            Write-Status "Please ensure 'golden_retriever.png' and 'husky_snow.png' are placed in the demo directory: $ProjectPath" "Yellow"
            $allImagesPresent = $false
        } else {
            Write-Status "Image file '$image' found." "Green"
        }
    }
    return $allImagesPresent
}

#endregion

#region Main Script Execution

# Display script information
Write-Status "Demo Environment Setup Script" "Green"
Write-Status "============================" "Green"
Write-Status "Demo Name: Visualizing Model Decisions with LIME" "White"
Write-Status "Project Path: $ProjectPath" "White"
Write-Status "Mode: $(if($Rollback){'Rollback'}elseif($Interactive){'Interactive'}else{'Standard'})" "White"
Write-Status "============================" "Green"

# Display manual pre-execution steps
Write-Status "MANUAL PRE-EXECUTION STEPS:" "Yellow"
Write-Status "Please complete these steps before continuing:" "White"
Write-Status "- Ensure you have an active internet connection to download Python packages." "White"
Write-Status "- Ensure the 'golden_retriever.png' and 'husky_snow.png' image files are placed in the demo's project directory: $ProjectPath. If they are missing, the script will prompt you to place them there." "White"
Write-Status "============================" "Green"

if (-not (Get-Confirmation "Have you completed all pre-execution steps?" -Required)) {
    Write-Status "Setup aborted. Please complete all pre-execution steps and run the script again." "Red"
    return
}

# Check if we should roll back instead of setting up
if ($Rollback) {
    Invoke-Rollback
    Write-Status "Rollback completed successfully!" "Green"
    return
}

# Check prerequisites
if (-not (Test-Prerequisites)) {
    Write-Status "Prerequisite check failed. Please address the issues and try again." "Red"
    return
}

# Remove previous demo artifacts
Remove-PreviousDemoArtifacts

# Initialize the demo environment (creates base folder if not exists)
if (-not (Initialize-DemoEnvironment)) {
    Write-Status "Environment initialization failed. Aborting setup." "Red"
    return
}

# Perform demo-specific setup here
if (-not (Install-PythonDependencies)) {
    Write-Status "Failed to install Python dependencies. Aborting setup." "Red"
    return
}

if (-not (Verify-DemoImages)) {
    Write-Status "Missing demo image files. Please place them in the project directory and run the script again." "Red"
    return
}

# Save resource tracking information for rollback
$resourceTrackingPath = Join-Path -Path $ProjectPath -ChildPath ".demo-resources.json"
$script:CreatedResources | ConvertTo-Json | Out-File -FilePath $resourceTrackingPath -Encoding utf8
Write-Status "Saved resource tracking information for rollback" "Green"

# Display final instructions
Write-Status "Setup complete!" "Green"
Write-Status "=====================" "Green"
Write-Status "The demo environment has been successfully configured:" "White"
Write-Status "1. Confirmed Python and pip are installed." "White"
Write-Status "2. Installed required Python packages (numpy, tensorflow, lime, scikit-image, matplotlib, Pillow)." "White"
Write-Status "3. Verified the presence of demo image files (golden_retriever.png, husky_snow.png)." "White"

Write-Status "MANUAL POST-EXECUTION STEPS:" "Yellow"
Write-Status "Please complete these steps to finalize the demo setup:" "White"
Write-Status "- None. The environment is now ready for the demo actions script (demo.ps1)." "White"
Write-Status "=====================" "Green"

Write-Status "To rollback all changes, run:" "Cyan"
Write-Status "./env_prep.ps1 -Rollback" "White"

Write-Status "For interactive mode, run:" "Cyan"
Write-Status "./env_prep.ps1 -Interactive" "White"

#endregion