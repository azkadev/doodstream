# Doodstream Client
 
**Doodstream Client** this open source project is free 

## Demo
 

## 📚️ Docs

1. [Documentation](/docs/)
2. [Youtube](https://youtube.com/)
3. [Telegram Support Group](https://t.me/)
4. [Contact Developer](https://github.com/) (check social media or readme profile github)

## 🔖️ Features

1. [x] 📱️ **Cross Platform** support (Device, Edge Severless functions)
2. [x] 📜️ **Standarization** Style Code
3. [x] ⌨️ **Cli** (Terminal for help you use this library or create project)
4. [x] 🔥️ **Api** (If you developer bot / userbot you can use this library without interact cli just add library and use 🚀️)
5. [x] 🧩️ **Customizable Extension** (if you want add extension so you can more speed up on development)
6. [x] ✨️ **Pretty Information** (user friendly for newbie)
 
## ❔️ Fun Fact

**This library 100%** use on every my create project (**App, Server, Bot, Userbot**)
 
## 📈️ Proggres
 
- **2024-06-03**
  Starting **Release Stable** With core Features

### 📥️ Install Library

1. **Dart**

```bash
dart pub add doodstream
```

- from github

```bash
dart pub add doodstream
```

## 🚀️ Quick Start

Example Quickstart script minimal for insight you or make you use this library because very simple 

```dart
import 'package:doodstream/doodstream.dart';
import 'package:general_lib/extension/dynamic.dart';
void main(List<String> args) async {
  String api_key = "";
  Doodstream doodstreamClient = Doodstream(api_key: api_key);
  Map res = await doodstreamClient.getMe();
  res.printPretty();
}
```
 