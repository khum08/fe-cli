#!/bin/bash

# step 1: init npm and generate package.json
npm init

# step 2: init git
git init

# step 3: install webpack
npm install webpack webpack-cli --save-dev

# step 4: install typescript
npm install --save-dev typescript ts-loader

# step 5: init tsconfig.json
tsc --init

# step 6: generate default webpack.config.js
echo "
const path = require('path');

module.exports = {
  entry: './src/index.ts',
  output: {
    filename: 'boundle.js',
    libraryTarget: 'umd',
    library: 'libraryName',
    path: path.resolve(__dirname, 'dist'),
  },
  resolve: {
    extensions: ['.ts', '.js'],
  },
  module: {
    rules: [
      {
        test: /\.ts?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },
  mode: 'development'
};
" >>webpack.config.js

# step 7: touch src/index.ts
if [ ! -d "/src" ]; then
    mkdir src
fi
touch src/index.ts


# step 8: generate default dist/index.html
if [ ! -d "/dist" ]; then
    mkdir dist
fi
echo "
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Default Page</title>
</head>
<body>
    <div>this is test page.</div>
    <script src='./boundle.js'></script>

</body>
</html>
">> dist/index.html

echo -e "\033[42;30;5m [Init Successfully!!!] \033[0m"
echo -e "\033[42;30;5m [You can add script(\"build\": \"webpack build\") to package.json file] \033[0m"

