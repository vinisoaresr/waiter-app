import styled from 'styled-components';

export const Overlay = styled.div`
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.8);
  backdrop-filter: blur(4.5px);

  display: flex;
  justify-content: center;
  align-items: center;
`;

export const ModalBody = styled.div`
  background: #fff;
  width: 480px;
  border-radius: 8px;
  padding: 32px;

  > header {
    display: flex;
    align-items: center;
    justify-content: space-between;

    span {
        font-size: 18px;
        font-weight: 600;
    }

    button {
      line-height: 0;
      border: 0;
      background: transparent;
    }
  }

  .status-container {
    margin-top: 32px;

    small {
      font-size: 14px;
      opacity: 0.8;
    }

    div {
      display: flex;
      align-items: center;
      margin-top: 8px;
      gap: 8px;
    }
    }
    .footer-container {
      display:flex;
      flex-direction: row;
      justify-content: space-between;
      margin-top: 32px;
    }
`;

export const OrderDetails = styled.div`
  margin-top: 32px;

  strong {
    font-size: 14px;
    font-weight: 500;
    opacity: 0.8;
  }

  .order-itens{
    margin-top: 8px;

    .item{
      display: flex;
      border-radius: 6px;

      & + .item{
        margin-top: 16px;
      }

      img {
        border-radius: 6px;
      }

      .quantity {
        font-size: 14px;
        color: #666;
        display: block;
        min-width: 20px;
        margin: 0px 12px;
      }
    }
  }

  .product-details {
    strong {
      display: block;
      margin-bottom: 4px;

      font-weight: 600;
      font-size: 16px;
      line-height: 150%;
      color: #333333;
    }

    span {
      font-size: 14px;
      color: #666;
    }
  }
`;


export const Actions = styled.footer`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 32px;

  .secundary {
    margin-top: 16px;
    color: #D73035;
    font-weight: 600;
    border: 0;
    background: transparent;

  }
`;
