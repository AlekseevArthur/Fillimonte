import React, { useState } from 'react'
import { Form, Button } from 'react-bootstrap'
import { useForm } from 'react-hook-form'


const Signin = ({ token }) => {
  const [error, setError] = useState(false)

  const { handleSubmit, register, formState: { errors } } = useForm();

  const onSubmit = values => {
    fetch('/users/sign_in',
      {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-type': 'application/json'
        },
        body: JSON.stringify({ user: values })
      })
      .then(res => res.redirected ? window.location.href = '/' : setError(true))
  }

  return (
    <Form className='container' style={{ maxWidth: '400px' }} onSubmit={handleSubmit(onSubmit)}>
      <h1>LOGIN</h1>
      {error ? <h4 style={{ color: 'red' }}>Error! Wrong email or password</h4> : null}
      <Form.Group className='mb-3' controlId='formBasicEmail'>
        <Form.Label>Email address</Form.Label>
        <Form.Control
          type="email"
          name='email'
          placeholder='Enter your email'
          {...register("email", {
            required: "Required",
            pattern: {
              value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
              message: "invalid email address"
            },
            maxLength: 20
          })} />
        {errors.email && errors.email.message}
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPassword'>
        <Form.Label>Password</Form.Label>
        <Form.Control
          name='password'
          type='password'
          placeholder='Password'
          {...register("password", {
            required: "Required"
          })} />
        {errors.password && errors.password.message}
      </Form.Group>

      <Button variant='primary' type='submit'>
        Submit
      </Button>
      <div>
        <a href='/users/sign_up'>Sign up</a>
      </div>
    </Form>
  )
}

export default Signin
