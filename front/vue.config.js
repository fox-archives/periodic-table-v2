module.exports = {
  devServer: {
    port: 8081,
    compress: true,
    proxy: {
      "api/": {
        target: "http://localhost:3000/"
      }
    }
  }
};
