# log_pro

[![pub package](https://img.shields.io/pub/v/log_pro.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/log_pro)
[![Last Commits](https://img.shields.io/github/last-commit/EslamFares/Log_Pro?logo=git&logoColor=white)](https://github.com/EslamFares/Log_Pro/commits/main)
[![Pull Requests](https://img.shields.io/github/issues-pr/EslamFares/Log_Pro?logo=github&logoColor=white)](https://github.com/EslamFares/Log_Pro/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/EslamFares/Log_Pro?logo=github&logoColor=white)](https://github.com/EslamFares/Log_Pro)
[![License](https://img.shields.io/github/license/EslamFares/Log_Pro?logo=open-source-initiative&logoColor=green)](https://github.com/EslamFares/Log_Pro/blob/main/LICENSE)

log_pro is a custom logging package for Flutter that simplifies tracking and debugging app behavior. It supports various log levels, such as debug, info, warning, and error, allowing developers to categorize and filter logs effectively.<br>


### Resources:

- [Pub Package](https://pub.dev/packages/log_pro)
- [GitHub Repository](https://github.com/EslamFares/Log_Pro)

## LogPro Flutter vscode extension
- For faster and easier use of the package through shortcuts that can be easily reassigned from the package settings. [logpro flutter](https://marketplace.visualstudio.com/items?itemName=EslamFares.logpro-flutter)

## Getting Started

Just create an instance of `LogPro` and start logging:

```dart
LogPro logPro = LogPro();

logPro.error("error");
```

## Output
<br> `Default styles` <br>
```
 [log] 
      ╔════════════════════════════════════════════════════════════════════════════════════
      ║[ERROR][00:26:54.170]:
      ║message
      ╚════════════════════════════════════════════════════════════════════════════════════
```
<br> `Simple styles` <br>
```diff
+ [log] [ERROR]:message
```

<br> `Use Print instead of log` <br>
```diff
+ D/EGL_emulation(24250): app_time_stats: avg=376.97ms min=9.17ms max=4292.33ms count=12
+ I/flutter (24250): 
+ I/flutter (24250): ╔════════════════════════════════════════════════════════════════════════════════════
+ I/flutter (24250): ║[ERROR][00:41:29.720]:
+ I/flutter (24250): ║Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
+ I/flutter (24250): ║Ipsum has been the industry's standard dummy text ever since the 1500s, when an
+ I/flutter (24250): ║unknown printer took a galley of type and scrambled it to make a type specimen book.
+ I/flutter (24250): ║It has survived not only five centuries, but also the leap into electronic
+ I/flutter (24250): ║typesetting, remaining essenti
+ I/flutter (24250): ╚════════════════════════════════════════════════════════════════════════════════════
+
```

## Output Images
<br> `Default styles` <br>
![](https://github.com/EslamFares/Log_Pro/blob/master/assets/img/1.png)
![](https://github.com/EslamFares/Log_Pro/blob/master/assets/img/2.png)
<br> `Simple styles` <br>
![](https://github.com/EslamFares/Log_Pro/blob/master/assets/img/simple%20shape.png)
<br> `Custom styles ex (line length - border shape)` <br>
![](https://github.com/EslamFares/Log_Pro/blob/master/assets/img/custoum%20line%20width%20-%20border%20.png)
<br> `Custom message styles (Default - Divided into equal lines - Put a border at the beginning of each line)` <br>
![](https://github.com/EslamFares/Log_Pro/blob/master/assets/img/large%20text%20customize.png)<br>
<br> `Use Print instead of log` <br>
![](https://github.com/EslamFares/Log_Pro/blob/master/assets/img/prt1.png)<br>



# Documentation

## Log level

You can log with different levels:

```dart
LogPro logPro = LogPro();
    logPro.info("info");
    logPro.error("error");
    logPro.normal("normal");
    logPro.warning("warning");
    logPro.magenta("magenta");
    logPro.logit("logit");
    logPro.grey("grey");
    logPro.green("green");
    logPro.risk("risk");
    logPro.whiteBlack("whiteBlack");
    logPro.prt("go", logColor: LogColors.red);

```

Customize

```dart
LogPro printIt = LogPro(
  title: "LogPro",
  usePrint: false,
  lineLength: 100,
  addEnterAtFirst: true,
  splitMsgToSameLineLength: true,
  splitMsgToSameLineLengthAddLeading: true,
  msgStartInNewLine: true,
  lineShape: "═",
  makeTitleSameWidth: false,
  fullLineTitleAndTime: false,
  simpleBorderOneLine: false,
  simpleShapeLog: false,
);
```

## Options

When you are finished with the debugging stage, you can stop LogPro without delete or commit it.
```dart
LogPro logPro = LogPro(
  isLoggingEnabled: false,
);
```
