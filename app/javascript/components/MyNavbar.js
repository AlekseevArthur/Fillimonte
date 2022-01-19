import React from 'react'
import { Container, Navbar } from 'react-bootstrap'

const MyNavbar = () => {
  return (
    <Navbar expand='lg' variant='dark' bg='dark'>
      <Container>
        <Navbar.Brand href='/'>Fillimonte</Navbar.Brand>
      </Container>
    </Navbar>
  )
}

export default MyNavbar