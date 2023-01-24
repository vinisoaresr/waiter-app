import { useEffect, useState } from 'react';
import { Order } from '../../models/Order';
import { OrderModal } from '../OrderModal/OrderModal';
import { Board, OrdersContainer } from './styles';

export interface OrderBoardProps {
  icon: string;
  title: string;
  orders: Order[];
  refreshOrders: (needRefresh: boolean) => void;
}


export function OrderBoard({ icon, title, orders, refreshOrders }: OrderBoardProps) {
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null);
  const [isModalOpen, setIsModalOpen] = useState(false);

  useEffect(() => {
    function handleKeyDown(event: KeyboardEvent) {
      if (event.key === 'Escape') {
        handleCloseModal();
      }
    }

    document.addEventListener('keydown', handleKeyDown);
    return () => {
      document.removeEventListener('keydown', handleKeyDown);
    };
  }, [handleCloseModal]);

  function handleOpenModal(order: Order) {
    setSelectedOrder(order);
    setIsModalOpen(true);
  }

  function handleCloseModal() {
    setIsModalOpen(false);
    setSelectedOrder(null);
    refreshOrders(true);
  }

  return (
    <Board>
      <OrderModal isOpen={isModalOpen} order={selectedOrder} callback={handleCloseModal} />
      <header>
        <span>{icon}</span>
        <strong>{title}</strong>
        <span>1</span>
      </header>
      {orders.length > 0 && <OrdersContainer>
        {orders.map((order) => (
          <button type='button' key={order._id} onClick={() => { handleOpenModal(order); }}>
            <strong>Mesa {order.table}</strong>
            {order.products.length > 1 ?
              <span>{order.products.length} itens</span> :
              <span>{order.products.length} item</span>
            }
          </button>
        ))}
      </OrdersContainer>}
    </Board>
  );
}


