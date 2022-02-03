import React from 'react';
import { Modal, Button } from 'react-bootstrap';

const ModalWelcome = (props) => {
  return (
    <Modal
      {...props}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">
          Hello stranger!
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <p>
          You need to log in to access all features.
        </p>
      </Modal.Body>
      <Modal.Footer>
        <Button variant='primary' onClick={props.onHide}>Close</Button>
      </Modal.Footer>
    </Modal>
  )
};

export default ModalWelcome;
