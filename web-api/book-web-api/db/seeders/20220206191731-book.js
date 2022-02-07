'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Books', [
      {
     bookName: 'my journey',
     authorName:'dr apj abdul kalam',
     createdAt: new Date(),
     updatedAt: new Date()
   },{
    bookName: 'Making of New India',
    authorName:'Bibek Debroy',
    createdAt: new Date(),
    updatedAt: new Date()
  },{
    bookName: 'Whispers of Time',
    authorName:'Krishna Saksena',
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
