START /WAIT project/Game.exe test reloader
git add .
git commit -m "Deploy from RMEBot"
git push origin master
cp doc/doc.js ../RMEx.github.io/RMEDoc/doc.js
git -C ../RMEx.github.io add .
git -C ../RMEx.github.io commit -m "Deploy from RMEBot"
git -C ../RMEx.github.io push origin master
