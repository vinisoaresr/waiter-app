import { Order } from '../../models/Order';
import { ModalBody, Overlay, OrderDetails, Actions } from './styles';
import icon from '../../assets/images/close-icon.svg';
import { formatCurrency } from '../../utils/formatCurrency';
import { Button } from '../Button/Button';

interface OrderModalProps {
  isOpen: boolean;
  order: Order | null;
  callback: () => void;
}


export function OrderModal({ isOpen, order, callback }: OrderModalProps) {

  if (!isOpen || !order) {
    callback();
    return null;
  }

  const total = order?.products.reduce((total, { product, quantity }) => {
    return total += product.price * quantity;
  }, 0);

  return (
    <>
      {isOpen &&
        <Overlay>
          <ModalBody>
            <header>
              <span>Mesa {order?.table}</span>
              <button onClick={callback}>
                <img src={icon} />
              </button>
            </header>
            <div className="status-container">
              <small className="status">Status do pedido</small>
              <div>
                <span>
                  {order?.status == 'WAITING' && '⏳'}
                  {order?.status == 'IN_PRODUCTION' && '🏋️‍♂️'}
                  {order?.status == 'DONE' && '✅'}
                </span>
                <strong>
                  {order?.status == 'WAITING' && 'Fila de espera'}
                  {order?.status == 'IN_PRODUCTION' && 'Em preparação'}
                  {order?.status == 'DONE' && 'Pronto'}
                </strong>
              </div>
            </div>
            <OrderDetails>
              <strong>Itens</strong>
              <div className="order-itens">
                {order?.products.map(({ _id, product, quantity }) => (
                  <div className='item' key={_id}>
                    <img
                      src={`http://localhost:3001/uploads/${product.imagePath}`}
                      alt={product.name}
                      width='56'
                      height='28.51'
                    />
                    <span className='quantity' >{quantity}x</span>
                    <div className='product-details' >
                      <strong>{product.name}</strong>
                      <span>{formatCurrency(product.price)}</span>
                    </div>
                  </div>
                ))}
              </div>
            </OrderDetails>
            <div className='footer-container' >
              <small>Total</small>
              <strong>{formatCurrency(total)}</strong>
            </div>
            <Actions>
              <Button
                text='Fechar pedido'
                label='✅'
                callback={() => { console.log('callback button'); }}
                disabled={order?.status == 'DONE'}
              />
              <button className='secundary' onClick={callback}>
                Cancelar pedido
              </button>
            </Actions>
          </ModalBody>
        </Overlay>
      }
    </>
  );
}
