git clone -b deploy https://github.com/polimappers/OsmInEdit.git
mv build/* OsmInEdit
rm -r build
cd OsmInEdit
git add .
git commit -m 'deploy'
git push origin deploy
cd ../
rm -rf OsmInEdit
