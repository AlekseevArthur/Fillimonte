import React, { useState } from 'react'
import { Toast, ToastContainer } from 'react-bootstrap';

const Toaster = ({ message, setShow }) => {
  return (
    <>
      <ToastContainer className="p-3" position='bottom-left'>
        {
          <Toast
            style={{
              position: 'fixed',
              left: '10px',
              bottom: '10px',
              zIndex: '1000'
            }}
            bg='warning'
            onClose={setShow}
            show={message.show}
            delay={4000}
            autohide>
            <Toast.Body>{message.message}</Toast.Body>
          </Toast>
        }
      </ToastContainer>
    </>
  );
}




export default Toaster