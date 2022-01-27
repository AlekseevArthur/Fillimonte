import React from 'react'
import { Card, ListGroupItem, ListGroup, Container } from 'react-bootstrap'

const Profile = ({ user, image }) => {
  return (
    <Container>
      <Card style={{ width: '18rem' }}>
        <Card.Img
          style={{ width: '100%', objectFit: 'cover' }}
          height={286}
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
    </Container>
  )
}

export default Profile
