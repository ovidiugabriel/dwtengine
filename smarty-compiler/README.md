# Why another Smarty compiler?

The original Smarty compiler written in PHP does not check syntactical errors ahead of time. (I mean, before you upload them on the server).

#### Environment Setup

```bash
export ANTLR3=/opt/antlr3/antlr-3.5.2-complete.jar
export ANTLRWORKS=/opt/antlr3/antlrworks-1.5.2-complete.jar
alias antlrworks='java -jar /opt/antlr3/antlrworks-1.5.2-complete.jar'
alias antlr3="java -jar $ANTLR3"
export CLASSPATH=".:$CLASSPATH:$ANTLR3"
```
#### Generate Lexer and Parser code

```
antlr3 -o ./smarty Smarty.g 
```

#### Run

```
cd ./smarty
javac *.java
java ParserFacade
```
