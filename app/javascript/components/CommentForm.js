import React, { useRef } from 'react';
import { Form, Button } from 'react-bootstrap'

const CommentForm = ({ updateComments }) => {
  const inputEl = useRef(null)

  const handleSubmit = (e) => {
    e.preventDefault()
    fetch(`${window.location.href}/comments`, {
      method: 'POST',
      headers: {
        'Content-type': 'application/json'
      },
      body: JSON.stringify({ comment: inputEl.current.value })
    })
      .then(() => {
        updateComments()
        inputEl.current.value = ''
      })
  }

  return (
    <Form onSubmit={handleSubmit}>
      <Form.Group className="mb-3" controlId="formBasicEmail">
        <Form.Control as="textarea" rows={2}
          ref={inputEl}
          autoComplete='off'
          name='text'
          placeholder='Leave your comment' />
      </Form.Group>
      <Button variant="primary" type="submit">
        Submit
      </Button>
    </Form>
  );
};

export default CommentForm;
