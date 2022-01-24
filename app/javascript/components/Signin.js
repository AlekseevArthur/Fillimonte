import React, { useState } from 'react'
import { Form, Button } from 'react-bootstrap'

const Signin = ({ token }) => {
  const [error, setError] = useState(false)
  const [values, setValues] = useState({ email: '', password: '' })

  const handleChange = (e) => {
    setValues({ ...values, [e.target.name]: e.target.value })
  }

  const handleSubmit = (e) => {
    e.preventDefault()
    console.log('hi login page')
    fetch('/users/sign_in',
      {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-type': 'application/json'
        },
        body: JSON.stringify({ user: { ...values } })
      })
      .then(res => res.redirected ? window.location.href = '/' : setError(true))
  }

  return (
    <Form className='container' style={{ maxWidth: '400px' }} onSubmit={handleSubmit}>
      <h1>LOGIN</h1>
      {error ? <h4 style={{ color: 'red' }}>Error! Wrong email or password</h4> : null}
      <Form.Group className="mb-3" controlId="formBasicEmail">
        <Form.Label>Email address</Form.Label>
        <Form.Control onChange={handleChange} name='email' type="email" placeholder="Enter email" />
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicPassword">
        <Form.Label>Password</Form.Label>
        <Form.Control onChange={handleChange} name='password' type="password" placeholder="Password" />
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicCheckbox">
        <Form.Check type="checkbox" label="Check me out" />
      </Form.Group>

      <Button variant="primary" type="submit">
        Submit
      </Button>
      <div>
        <a href='/users/sign_up'>Sign up</a>
      </div>
    </Form>
  )
}

export default Signin
