'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    
      await queryInterface.bulkInsert('Cars', [
        {
        carName: ' maruti',
        branchName:'pune',
        createdAt: new Date(),
        updatedAt: new Date()
      },{
        carName: 'tata-nano',
        branchName:'kolhapur',
        createdAt: new Date(),
        updatedAt: new Date()
      },{
        carName: 'mahindra-thar',
        branchName:'nagpur',
        createdAt: new Date(),
        updatedAt: new Date()
      },{
        carName: 'mahindra-suv',
        branchName:'mumbai',
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
