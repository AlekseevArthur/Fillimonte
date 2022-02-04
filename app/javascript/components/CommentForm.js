import React, { useRef, useState } from 'react';
import { Form, Button } from 'react-bootstrap'
import Toaster from './Toaster';


const CommentForm = ({ updateComments }) => {
  const inputEl = useRef(null)
  const [message, setMessage] = useState({ message: '', show: false })

  const handleSubmit = (e) => {
    e.preventDefault()
    fetch(`${window.location.href}/comments`, {
      method: 'POST',
      headers: {
        'Content-type': 'application/json'
      },
      body: JSON.stringify({ comment: inputEl.current.value })
    })
      .then((res) => {
        if (res.ok) {
          updateComments()
          inputEl.current.value = ''
        }
        else if (res.status === 422) {
          setMessage({ message: 'Error, your comment invalid =(', show: true })
        }
      })
  }

  return (
    <Form onSubmit={handleSubmit}>
      <Toaster
        message={message}
        setShow={() => setMessage({ message: '', show: false })} />
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
