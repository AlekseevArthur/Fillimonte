import React, { useState } from 'react'
import { Form, Button } from 'react-bootstrap'
import { useForm } from 'react-hook-form'


const Signup = ({ token }) => {
  const [error, setError] = useState(false)

  const { }

  const handleSubmit = (e) => {
    e.preventDefault()
    const formData = new FormData(e.target)
    fetch('/users',
      {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token
        },
        body: formData
      })
      .then(res => res.redirected ? window.location.href = '/' : setError(true))
  }

  return (
    <Form className='container' style={{ maxWidth: '400px' }} onSubmit={handleSubmit}>
      <h1>SIGN UP</h1>
      {error ? <h4 style={{ color: 'red' }}>Error! Wrong email or password</h4> : null}
      <Form.Group className='mb-3' controlId='formBasicEmail'>
        <Form.Label>Email address</Form.Label>
        <Form.Control name='user[email]' type='email' placeholder='Enter email' />
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPassword'>
        <Form.Label>Password</Form.Label>
        <Form.Control name='user[password]' type='password' placeholder='Password' />
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPasswordConfirmation'>
        <Form.Label>Password confirtamion</Form.Label>
        <Form.Control name='user[password_confirmation]' type='password' placeholder='Confirm' />
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicName'>
        <Form.Label>Name</Form.Label>
        <Form.Control name='user[name]' type='text' placeholder='Enter name' />
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPhone'>
        <Form.Label>Phone</Form.Label>
        <Form.Control name='user[phone]' type='text' placeholder='Enter phone (correct)' />
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicImage'>
        <Form.Label>Profile image</Form.Label>
        <Form.Control name='user[image]' type='file' />
      </Form.Group>

      <Button variant='primary' type='submit'>
        Submit
      </Button>
      <div>
        <a href='/users/sign_in'>Sign in</a>
      </div>
    </Form>
  )
}

export default Signup
