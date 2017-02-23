var TextExtract = require('extract-text-webpack-plugin'),
    appCss = new TextExtract('application.css');

module.exports = {
    entry: './content/assets/javascripts/application.js',
    output: {
        path: 'output/assets',
        filename: 'application.js'
    },
    module: {
        loaders: [
            { test: /\.scss$/, loader: appCss.extract({fallback: 'style-loader', use: 'css-loader!sass-loader' }) },
            { test: /\.(svg|woff2?|ttf|eot)$/, loader: 'url-loader?limit=4096' }
        ]
    },
    plugins: [appCss]
};
