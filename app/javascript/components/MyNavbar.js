import React from 'react'
import { Container, Navbar, Nav } from 'react-bootstrap'

const MyNavbar = () => {
  return (
    <Navbar expand='lg' variant='dark' bg='dark'>
      <Container>
        <Navbar.Brand href='/'>Fillimonte</Navbar.Brand>
        <Nav>
          <Nav.Link href='/users/sign_in'>Login</Nav.Link>
        </Nav>
      </Container>
    </Navbar>
  )
}

export default MyNavbar