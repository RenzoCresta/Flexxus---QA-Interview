context('Login Automation with Cypress', () => {
  it('login scenario', () => {
      cy.visit('https://flxptovta.flexxus.com.ar/signin')
      cy.get('#user').click().type('DEMO')
      cy.get('#password').click().type('DEMO')
      cy.get('.ant-btn ant-btn-primary').click()

      
  })
})