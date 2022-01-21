import React from 'react'
import { Container, Navbar, Nav } from 'react-bootstrap'

const MyNavbar = ({ user }) => {
  return (
    <Navbar expand='lg' variant='dark' bg='dark'>
      <Container>
        <Navbar.Brand href='/'>Fillimonte</Navbar.Brand>
        <Nav>
          {user ? <ProfileNav user={user} /> : <Nav.Link href='/users/sign_in'>Login</Nav.Link>}
        </Nav>
      </Container>
    </Navbar>
  )
}

const ProfileNav = ({ user }) => {
  return <div style={{ color: 'green' }}>
    {user.name}
  </div>
}


export default MyNavbar