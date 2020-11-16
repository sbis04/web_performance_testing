[![Codemagic build status](https://api.codemagic.io/apps/5fa6dbf4e55b871f6b841471/5fa6dbf4e55b871f6b841470/status_badge.svg)](https://codemagic.io/apps/5fa6dbf4e55b871f6b841471/5fa6dbf4e55b871f6b841470/latest_build)
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

## License

Copyright (c) 2020 Souvik Biswas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
