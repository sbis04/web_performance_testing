# Flutter Web Performance Testing

An example project for testing Flutter Web performance on **Chrome**, and retrieving benchmark results using Chrome’s DevTools.

This app uses the [web_benchmarks_framework](https://github.com/material-components/material-components-flutter-experimental/tree/develop/web_benchmarks_framework) package.

## Sample app

The sample app that I have used here is called **Coffee Brewery**. It just displays a list of coffee types along with some description. A floating action button (FAB) is present to increment the number of coffees in the cart.

![](https://github.com/sbis04/web_performance_testing/raw/master/screenshots/coffee_brewery.png)

## Codemagic YAML

You can use the following `codemagic.yaml` file for running and generating the test result on **Codemagic CI/CD**.

> Modify the YAML as per your workflow.

```yaml
workflows:
  flutter-web:
    name: Performance testing
    environment:
      flutter: dev
    scripts:
      - name: Switch to dart dev
        script: |
          brew unlink dart
          brew install --head dart
      - name: Enable flutter web
        script: |
          flutter config --enable-web
      - name: Get flutter packages
        script: |
          cd . && flutter packages pub get
      - name: Run benchmarks
        script: |
          dart test/run_benchmarks.dart
    artifacts:
      - report.json
      - build/web/
    publishing:
      email:
        recipients:
          - user@example.com # Enter your email here
```

The test result will be available in the `report.json` file.
