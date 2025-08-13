# API Test Automation Framework

This project contains automated API tests using Postman collections and Newman for execution. The framework supports both local testing and CI/CD automation through GitHub Actions.

## Project Structure

```
api-framework/
├── .github/
│   └── workflows/
│       └── postman-ci.yml          # GitHub Actions workflow for CI/CD
├── collections/
│   └── remwaste-api-framework.postman_collection.json  # Main test collection
├── environments/
│   └── RemwasteENV.postman_environments.json          # Environment variables
├── data/
│   └── login-cases.json            # Test data for data-driven login tests
├── reports/                        # Generated test reports (created at runtime)
│   ├── remwaste-report.html        # HTML test report
│   └── remwaste-report.json        # JSON test report
├── run-tests.sh                    # Local test execution script for newman
└── README.md                       # This file
```

## Getting Started

### Prerequisites

Before running the tests, ensure you have the following installed:

- **Node.js** (version 18 or higher recommended)
- **npm** (comes with Node.js)
- **Git** (for cloning the repository)
- **Git Bash** (For Windows users)

### Local Setup from Scratch

1. **Clone the repository**
   ```bash
   git clone https://github.com/nipuna1989/Postman-Newman-API-Framework
   ```

2. **Navigate to the project directory**
   ```bash
   cd api-framework
   ```

3. **Install Newman and required packages**
   ```bash
   # Install Newman globally
   npm install -g newman
   
   # Install HTML reporter for better test reports
   npm install -g newman-reporter-htmlextra
   ```

4. **Verify installation**
   ```bash
   newman --version
   ```

## Running Tests Locally

### Method 1: Using the Shell Script (Recommended)

```bash
# Make the script executable (Linux/Mac/Windows Git Bash)
chmod +x run-tests.sh

# Run the tests
./run-tests.sh
```

**Note for Windows users**: Use Git Bash terminal to run the shell script.

### Method 2: Direct Newman Command

```bash
newman run collections/remwaste-api-framework.postman_collection.json \
  -e environments/RemwasteENV.postman_environments.json \
  --iteration-data data/login-cases.json \
  --reporters cli,htmlextra,json \
  --reporter-htmlextra-export reports/remwaste-report.html \
  --reporter-json-export reports/remwaste-report.json
```

## Test Reports

After running the tests, you'll find the following reports in the `reports/` directory:

- **HTML Report**: `reports/remwaste-report.html` - Interactive, detailed test report
- **JSON Report**: `reports/remwaste-report.json` - Machine-readable test results

To view the HTML report, simply open it in your web browser.

## CI/CD with GitHub Actions

### Automatic Triggers

The tests run automatically on:
- **Push to main branch**
- **Pull requests to main branch**

### Manual Execution

You can also run tests on-demand:

1. Go to your GitHub repository
2. Click on the **Actions** tab
3. Select **"Run Rem Waste API Tests"** workflow
4. Click **"Run workflow"** button
5. Choose the branch and click **"Run workflow"**

### Viewing CI Results

After the workflow completes:

1. **Test Results**: Check the workflow logs for console output
2. **HTML Report**: Download from the "Artifacts" section as `remwaste-html-report`
3. **JSON Report**: Download from the "Artifacts" section as `remwaste-json-report`

### CI Configuration

The GitHub Actions workflow (`.github/workflows/postman-ci.yml`) includes:

- **Node.js 18** setup
- **Newman and newman-reporter-htmlextra** installation
- **Test execution** with all reporters
- **Artifact upload** for both HTML and JSON reports
- **Always runs** (even if tests fail) to generate reports

## Configuration Files

### Environment Variables (`environments/RemwasteENV.postman_environments.json`)

Contains environment-specific configurations such as:
- Base URLs
- API keys
- Authentication tokens
- Environment-specific variables

### Test Data (`data/login-cases.json`)

Contains test data for data-driven testing:
- User credentials
- Test scenarios
- Input variations

### Collection (`collections/remwaste-api-framework.postman_collection.json`)

Contains:
- API endpoint definitions
- Test scripts
- Assertions and validations
- Pre-request scripts


## Limitations

### GitHub Actions Workflow Access
While this repository is public and anyone can view and fork it, there are some inherent limitations with GitHub Actions:

- **Manual Test Triggers**: Only repository collaborators (users with write access) can manually trigger the test workflow from the Actions tab.
  - This is a GitHub security feature to protect repositories from potential abuse.
  - External contributors can still:
    - View all test runs and their results
    - Have tests automatically run on their Pull Requests
    - Fork the repository and run tests in their own fork

### Workarounds for External Contributors
If you need to run tests without creating a Pull Request:
1. Fork the repository
2. Enable GitHub Actions in your fork
3. Run the tests in your forked repository

For active contributors, repository maintainers can grant collaborator access on a case-by-case basis.

---
