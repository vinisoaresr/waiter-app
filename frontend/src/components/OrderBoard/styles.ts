import styled from 'styled-components';

export const Board = styled.div`
  display: flex;
  flex: 1;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 16px;
  border: solid 1px rgba(204, 204, 204, 0.4);
  border-radius: 16px;

  > header {
    padding: 8px;
    font-size: 14px;
    display: flex;
    align-items: center;
    gap: 8px;
  }
`;

export const OrdersContainer = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
  margin-top: 24px;

  button {
    background: #fff;
    width: 100%;
    height: 128px;
    border: solid 1px rgba(204, 204, 204, 0.4);
    border-radius: 8px;

    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 4px;

    > strong {
      font-weight: 500;
    }

    > span {
      font-size: 14px;
      color: #666;
    }


    & + button {
      margin-top: 24px;
    }
  }
  `;
