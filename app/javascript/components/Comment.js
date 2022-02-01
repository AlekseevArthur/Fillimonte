import React from 'react'
import { Card, Button } from 'react-bootstrap'

const Comment = ({ comment, updateComments }) => {

  function deleteComment() {
    fetch(`${window.location.href}/comments/${comment.comment_id}`, {
      method: 'DELETE',
      headers: {
        'Content-type': 'application/json'
      }
    })
      .then(() => updateComments())
  }

  return <Card
    border='success'
  >
    <Card.Body>
      <blockquote className='blockquote mb-0'>
        <p>
          {' '}
          {comment.text} {' '}
        </p>
        <footer className='blockquote-footer'>
          <cite title='Source Title'>{comment.author}</cite>
        </footer>
      </blockquote>
      {comment.canDelete
        ? <Button
          onClick={deleteComment}
          variant="danger">x</Button>
        : null}
    </Card.Body>
  </Card>
}

export default Comment
