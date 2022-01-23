'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
     await queryInterface.bulkInsert(
       "cars",
       [
         {
           carName: "xuv700",
           brandName: "mahindra",
           createdAt: new Date(),
           updatedAt: new Date(),
         },
         {
           carName: "punch",
           brandName: "tata",
           createdAt: new Date(),
           updatedAt: new Date(),
         },
         {
           carName: "fortuner",
           brandName: "toyoto",
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
