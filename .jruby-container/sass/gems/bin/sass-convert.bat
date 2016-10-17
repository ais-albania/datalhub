@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"jruby-complete-1.7.18.jar" "D:/arb/dev/IdeaProjects/catalog/.jruby-container/sass/gems/bin/sass-convert" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"jruby-complete-1.7.18.jar" "%~dpn0" %*
