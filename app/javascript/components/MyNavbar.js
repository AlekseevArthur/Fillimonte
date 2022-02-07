import React, { useState } from 'react'
import { Container, Navbar, Nav, Image, NavDropdown } from 'react-bootstrap'

const MyNavbar = ({ user, token, image }) => {
  return (
    <Navbar expand='lg' variant='dark' bg='dark'>
      <Container>
        <Navbar.Brand href='/'>Fillimonte</Navbar.Brand>
        <Nav>
          {user
            ? <ProfileNav user={user} token={token} image={image} />
            : <Nav.Link href='/users/sign_in'>Login</Nav.Link>
          }
        </Nav>
      </Container>
    </Navbar>
  )
}

const ProfileNav = ({ user, token, image }) => {
  const logout = () => {
    fetch('/users/sign_out', {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': token
      }
    })
      .then(() => window.location = '/')
  }

  const [show, setShow] = useState(false)

  const redirect = () => {
    window.location.href = '/user'
  }

  return (
    <NavDropdown id='lol'
      show={show}
      onMouseEnter={()=>setShow(true)}
      onMouseLeave={()=>setShow(false)}
      title={
        <>
          <span style={{ paddingRight: '5px' }} className="ms-1">{user.name}   </span>
          <Image
            roundedCircle
            width={30}
            height={30}
            src={image}
          />
        </>
      }
      id='nav-dropdown'>
      <NavDropdown.Item onClick={redirect}>Profile</NavDropdown.Item>
      <NavDropdown.Item onClick={logout}>Logout</NavDropdown.Item>
    </NavDropdown>
  )
}


export default MyNavbar