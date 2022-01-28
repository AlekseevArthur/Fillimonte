import React, { useState } from 'react'
import { Card, ListGroupItem, ListGroup, Container, Row, Col, Tabs, Tab } from 'react-bootstrap'
import CategoryPanel from './CategoryPanel';

const Profile = ({ user, image }) => {

  return (
    <Container>
      <hr />
      <Row>
        <Col sm={4}>
          <UserCard user={user} image={image} />
        </Col>
        <Col sm={8}>
          <CategoryPanel />
        </Col>
      </Row>
    </Container >
  )
}

const UserCard = ({ user, image }) => {
  return (
    <Card style={{ width: '15rem', padding: 0 }}>
      <Card.Img
        style={{ width: '100%', objectFit: 'cover' }}
        height={238}
        variant='top'
        src={image} />
      <Card.Body>
        <Card.Title>{user.name}</Card.Title>
        <Card.Text>
          {user.email}
        </Card.Text>
      </Card.Body>
      <ListGroup className='list-group-flush'>
        <ListGroupItem>{user.phone}</ListGroupItem>
      </ListGroup>
    </Card>
  )
}


export default Profile
