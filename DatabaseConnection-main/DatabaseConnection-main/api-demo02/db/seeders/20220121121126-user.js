'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    
    
     await queryInterface.bulkInsert('Users', [
       {
        firstName: 'Madhav ',
        lastName: 'Tengetol',
        createdAt: new Date(),
        updatedAt: new Date()
        
      },
      {
        firstName: 'Satyam ',
        lastName: 'Raut',
        createdAt: new Date(),
        updatedAt: new Date()
        
      },
      {
        firstName: 'Yasir ',
        lastName: 'Mulla',
        createdAt: new Date(),
        updatedAt: new Date()
        
      }
    ], {});
    
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
