import { useEffect, useState } from 'react';
import { Order } from '../../models/Order';
import { OrderBoard } from '../OrderBoard/OrderBoard';
import { Container } from './styles';


export function Orders() {
  const [waitingOrders, setWaitingOrders] = useState<Order[]>([]);
  const [inProductionOrders, setInProductionOrders] = useState<Order[]>([]);
  const [doneOrders, setDoneOrders] = useState<Order[]>([]);

  const [needRefresh, setNeedRefresh] = useState(true);

  useEffect(
    () => {
      if (needRefresh) {
        setNeedRefresh(false);
        fetch('http://192.168.1.7:3001/orders').then(
          response => response.json()
        ).then((data: Order[]) => {
          setWaitingOrders(data.filter(order => order.status === 'WAITING'));
          setInProductionOrders(data.filter(order => order.status === 'IN_PRODUCTION'));
          setDoneOrders(data.filter(order => order.status === 'DONE'));
        });
      }
    }, [setNeedRefresh, needRefresh]
  );

  return (
    <Container>
      <OrderBoard icon='⏳' title='Fila de Espera' orders={waitingOrders} refreshOrders={setNeedRefresh} />
      <OrderBoard icon='🏋️‍♂️' title='Em preparação' orders={inProductionOrders} refreshOrders={setNeedRefresh} />
      <OrderBoard icon='✅' title='Finalizado' orders={doneOrders} refreshOrders={setNeedRefresh} />
    </Container>
  );
}
