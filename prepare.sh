#!/usr/bin/env bash
rm -rf .git/hooks/pre-commit
echo "Preparing githooks"
echo "#!/usr/bin/env bash
echo \"Start formatting\"
dart format lib/ test/ domain/lib/ domain/test/ data/lib/ data/test/
git add .
echo \"done\"" >> .git/hooks/pre-commit
chmod -R +x .git/hooks/pre-commit;
echo "Done"
