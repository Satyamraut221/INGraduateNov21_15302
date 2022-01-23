'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert(
      "books",
      [
        {
          bookName: "The Lord of the Rings",
          authorName: "J.R.R. Tolkien",
          publishdate: "1954-07-29",
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          bookName: "The Hobbit",
          authorName: "J.R.R. Tolkien",
          publishdate: "1937-09-21",
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          bookName: "The Catcher in the Rye",
          authorName: "J.D. Salinger",
          publishdate: "1951-09-21",
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      ],
      {}
    );
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
