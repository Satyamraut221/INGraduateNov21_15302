'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class book extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  book.init({
    authorName: DataTypes.STRING,
    bookName: DataTypes.STRING,
    publishdate: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'book',
  });
  return book;
};