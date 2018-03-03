# 1. Flutter Examples

<!-- TOC -->

- [1. Flutter Examples](#1-flutter-examples)
    - [1.1. Development Environment Setup](#11-development-environment-setup)
        - [1.1.1. Mac OS X High Sierra](#111-mac-os-x-high-sierra)
            - [1.1.1.1. ios-deploy not installing from brew](#1111-ios-deploy-not-installing-from-brew)

<!-- /TOC -->

## 1.1. Development Environment Setup

See https://flutter.io/setup-macos/

### 1.1.1. Mac OS X High Sierra 

#### 1.1.1.1. ios-deploy not installing from brew
Workaround:

    If you are under Sierra you need to add the flag --unsafe-perm=true
    ```
        sudo npm install -g ios-deploy --unsafe-perm=true
    ```

See: https://github.com/phonegap/ios-deploy/issues/308