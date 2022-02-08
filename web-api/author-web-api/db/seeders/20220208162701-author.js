'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
   
     
     
      await queryInterface.bulkInsert('Authors', [
        
        {
        authorName: 'brock lesnar',
        bookName:'death clutch',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        authorName: 'the indian story',
        bookName:'bimal jain',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        authorName: 'suparipalana',
        bookName:'shailender joshi',
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
