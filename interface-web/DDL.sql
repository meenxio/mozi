CREATE TABLE orders
(
    Orderid INT(11) PRIMARY KEY NOT NULL auto_increment COMMENT '订单ID, 主键',
    UserID INT(11) COMMENT '用户ID',
    Currency VARCHAR(20) COMMENT '币种，ETH,FBC,XDAG等',
    QuantityEntered FLOAT COMMENT '用户下单数量，小数',
    PriceEntered FLOAT COMMENT '1个本单位兑欲交易单位价，如卖出1单位ETH 欲兑换 100,000 FBC,则此处填100,000;',
    PartyB VARCHAR(20) COMMENT '待兑换币种,ETH,FBC,XDAG',
    Direction VARCHAR(10) COMMENT '买单或卖单, Buy, Sell',
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
    ExpiryDate DATE COMMENT '订单失效日期，默认NULL',
    HasSplitOrder VARCHAR(1) DEFAULT '0' COMMENT '因部分或全部成交，有分订单Splitorder记录',
    Fulfilled VARCHAR(1) DEFAULT '0' COMMENT '已完全成交',
    QuantityRemain FLOAT DEFAULT '0' COMMENT '待成交的数量',
    Address VARCHAR(100)
);

CREATE TABLE splitorders
(
    FK_OrderID VARCHAR(50),
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    QuantityExecuted FLOAT,
    PriceExecuted FLOAT,
    Address VARCHAR(100),
    SplitOrderid INT(11) PRIMARY KEY NOT NULL auto_increment 
);

CREATE TABLE tradepair
(
    Currency1 VARCHAR(20),
    Currency2 VARCHAR(20),
    exchange DOUBLE
);