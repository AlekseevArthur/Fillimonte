import React from 'react'
import { Card, ListGroupItem, ListGroup } from 'react-bootstrap'

const Profile = ({ user, image }) => {
  return (
    <Card style={{ width: '18rem' }}>
      <Card.Img variant='top' src={image} />
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
