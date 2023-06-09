#import "template.typ": *

#chapter("Lecture 3: Modern Network Payment System")

= Introduction of this lecture

= Payment principle and traditional payment system

== Economic transactions and Payment principle

/ Definition of payment: A party-acceptable transfer of a monetary claim from a payer to a payee.

*The relationship between payment and money*: interdependence and mutual promotion
  + Physical payments era (Physical money)
  + Credit payments era (Credit money)
  + Electronic payments era (Electronic money)

== Traditional payment system

=== Overview of the payment system
/ Definition: A comprehensive financial arrangement in which the organizations or institutions providing payment services realize the settlement of debts and liabilities and the transfer of funds through the application of payment instruments under the framework of established regulations and systems.
/ Participating Subjects: Customers (merchants and consumers), commercial banks, central banks
/ Composition: Payment service organizations, payment instruments, payment systems, regulation and system-based payment supervision

=== Payment Service Organizations

/ Definition: Specialized agencies involved in the operation, service and management of the payment system, and have an important role in the payment system.
- Central bank at the center.
- Financial institutions, mainly commercial banks, are the backbone of the provision of non-cash settlement and payment services and have an irreplaceable functional status.
- Clearing institutions that provide professional fund clearing services are another important part of the payment system and payment entities.
  - Clearing institutions include bill exchanges, fund clearing centers, securities registration and settlement institutions, etc. Clearing institutions each serve different business areas

=== Payment instruments

/ Definition: The basis and carrier of payment business, and can be divided into two types: cash and non-cash.
- Non-cash payment instruments
  - Carriers for the settlement of debts and the transfer of monetary value, transmitted through a payment system.
  - Mainly includes bills, bank cards, transfer vouchers and other payment instruments.

=== Payment System

- People's Bank of China Payment Systems
  + Large amount real-time payment system
  + Small amount batch payment system
  + National check image exchange system
  + Domestic and foreign currency payment system
  + Co-city bill clearing system
  + Online payment inter-bank clearing system
- Other Payment Systems
  + Intra-bank payment system for banking financial institutions
  + Interbank payment system for bank cards
  + City commercial bank draft processing system and payment clearing system
  + Agricultural credit bank payment clearing system
  + Co-city bill clearing system
  + RMB cross-border payment system

== Traditional payment technologies

=== Payment Instruments

- *Credit card payment settlement* refers to the use of credit cards as the carrier of payment settlement.
- *Funds transfer* is a settlement method in which the remitting customer entrusts the bank to pay its money to the recipient, so it is also called bank remittance, usually for business-to-business remittance.
- *Check payment settlement* refers to the payment and settlement of paper checks, which is essentially a special paper-based payment and settlement instrument provided by banks based on a special format and usage rules.
- *Automated Clearing House (ACH) payments* are an arrangement for payments between member institutions by electronic debit or credit entered into by member depository institutions.
- *Electronic funds transfer* is when a bank allows funds to be transferred between accounts in the form of electronic messages in an electronic computer system.

= Modern payment revolutions and innovations

== Payment problems in e-commerce
	
/ Definition of e-commerce: A new business operation model in which consumers can shop online, merchants can transact online and make online electronic payments, and various business activities, transactions, financial activities and related comprehensive service activities are formed by buyers and sellers based on browser or server applications to conduct various business activities in a network environment without meeting each other.

Payment problems have become an important factor limiting the
development of e-commerce
- Traditional	payment	settlement	methods	in	the	industrial	economy	have shown many limitations in terms of efficiency, security and cost.
- The	problem	of	asynchronous	transactions	in	e-commerce	reduces	the incentive for buyers and sellers to transact through e-commerce platforms.

== The rise and classifications of network payment

/ Definition: The modern means of payment and settlement based on e-commerce, with commercial banks as the main body, using a secure Internet-based operating platform, and providing monetary payments or fund transfers between customers of transactions through the network.
Network payment has the following four *characteristics*, which better meet the requirements of e-commerce for efficiency, security and cost.
+ Payments are done digitally.
+ Convenient, fast and efficient.
+ Lightweight and cost effectiveness.
+ High security and consistency.

*Classification by the nature of the entity conducting e-commerce*
+ B2C type network payment method
  - Network payment methods used for network transactions between businesses and individuals, government departments and individuals, and individuals and individuals.
  - Used for not a large amount of network transactions payment settlement, the application is more convenient and flexible, the implementation is also relatively simple, and the risk is not large.
+ B2B type network payment method
  - Network payment methods used for business-to-business and business-to- government network transactions.
  - Suitable for payment settlement of larger amounts of network transactions.

*Classification by the size of network payment amount*
+ Micropayments;
+ Small retail payments;
+ Medium to large amount of money transfer system.

= Third party payment and mobile payment

== Third party payment

=== The rise of third-party payment

- In order to ensure equivalence in e-commerce activities and to solve the problem of mutual distrust between buyers and sellers, the principle of simultaneous exchange needs to be followed.
- Process-oriented step-by-step payment method is an effective solution to the above problems.
  - The payment is not completed in one step from the initiation of payment to the transfer of ownership to the other party, but the intermediary escrow link is added in the middle, from the original direct payment to improve the indirect transfer, and the business is changed from one-step completion to step-by-step operation, thus forming a monitorable process, and payment is made conditionally according to the steps

=== Concept

/ U.S., 1999, Financial Services Modernization Act:
- Third party payment institutions are defined as non-bank financial institutions, and third-party payments are considered as money transfer business, which is essentially an extension of traditional money services.
/ EU, 1998, Electronic Money Directive states:
- The medium of third party payments can only be commercial bank money or electronic money, and consider third party payment institutions similar to PayPal as electronic money issuers.
/ People's Bank of China, 2010, Measures for the Administration of Payment Services by Non-financial Institutions:
- Non-financial institution payment services refer to network payments, prepaid cards, bank card acquiring and other payment services determined by the People's Bank of China provided by non-financial institutions as payment intermediaries of receivers and payers.
/ This course: Payment services provided by third-party independent institutions with certain strength and credibility guarantee, independent of merchants and banks, through contracts with the countries where the products are located and major banks.

=== Trading Process

#figure(image("img/lec3/g6666.png"))

=== Third party payment direct connection model

#figure(image("img/lec3/24-1.png", width: 70%))

=== Third party payment network federation model

#figure(image("img/lec3/25-1.png", width: 80%))

=== Types of third party payment platforms

/ Bank gateway agent payment type:
- This type of third party payment platforms sign contracts with major banks as agent gateways, seamlessly connect the payment gateway interfaces provided by banks with their own payment systems, and establish a payment system platform that integrates payment gateways of many banks.
- Bank payment gateway is a set of servers connecting the bank network and the Internet, the main role is to complete the communication between the two, protocol conversion and data encryption, decryption, in order to protect the bank's internal security.
/ Account payment type:
- This type of third party payment is based on the way the user account makes payments.
- Account payments are safer because they do not require frequent entry of card passwords and account numbers, but they are less resistant to counterfeit websites and account fraud and present certain security risks.

== Mobile payment

=== Overview

/ Definition: Mobile payment, aka cell phone payment, refers to the use of wireless communication technology to transfer monetary value to settle debt relationships through mobile communication devices.
/ Classification:
- Cell phone near field payment (NFC)
- Cell phone remote payment

=== Near Field Payment (NFC)

/ Definition: The communication between the smart card embedded in the mobile terminal and the payment acceptance terminal through contactless means to realize money payment and fund transfer.
/ Technologies:
- Infrared technology
- Bluetooth technology
- RFID
- NFC

#place(right, image("img/lec3/28-1.png", width: 40%), dy: -60pt)

=== Remote Payment

/ Definition: The act of mobile terminals sending payment instructions through wireless communication networks by means of SMS, WAP, client software and client software plus smart cards to realize monetary payments and fund transfers.
/ Technologies:
- SMS
- IVR
- WAP
- USSD

#place(right, image("img/lec3/29-1.png", width: 40%), dy: -60pt)

= The development of payment scenarios and services and their impact

== Development of payment scenarios

- Any payment scenario consists of a payee and a payer.
  - The competition for payees is manifested by various means to make payees support the platform and give top priority to the payment instruments provided by the payment platform.
  - The competition for the payer is manifested in the cultivation of payment habits through discounts and improving the payment experience of the payer, so that payers unconsciously use the platform's payment tools when making payments.
- The payment scenarios provided by nodal companies are the core resources of third party payment platforms.
  - Nodal companies are those that hold payment scenarios or have channel advantages in the real economy.
  - The core of a successful third-party payment platform, which must be backed by a nodal enterprise, is whether it covers enough payment scenarios or provides exclusive and important payment scenarios.
- Classification of payment scenarios
#figure(image("img/lec3/Classification of payment scenarios.svg"))

== Development of payment services

/ Financial services such as loans and finance: Credit loans, credit card repayment, consumer installment and other financial services.
/ Marketing Promotion Business: The massive amount of user data from third-party payments can be used to analyze the brands consumers follow, active merchant areas, etc., and to build a promotion system with additional payment functions, membership functions and social functions.
/ Credit investigation: The core data of the payment platform is based on user consumption and payment, which can complement and improve the existing credit system.
/ Public Welfare: The mobile payment platform provides users with a wide range of donation channels by connecting to multiple charity organizations.
/ Socialization: Mobile payment platform achieves a win-win situation for both payment and social business by introducing social features.

== Impact of payment development

=== Promoting service revolutions in the financial industry
- The most direct reason for the emergence of network payment is to solve the problem of cumbersome process and long arrival time of inter-bank and inter-location transfer for individuals and enterprises.
- Domestic commercial banks began to rely on advanced computer network technology, actively carry out financial innovation, launched a multi-channel electronic banking integrated business system including online banking, mobile banking, ATM, POS, etc.
- The traditional banking industry is moving towards "Internet banking", the core and ultimate goal of which is to optimize financial business processes and innovate financial products with advanced information technology around the financial service needs of customers in the Internet era, so as to bring efficient and satisfactory services to customers.

=== Improve the efficiency of social operation

/ Specialized division of labor:
- Internet payment services promote the professional division of labor among banks, merchants and third-party payment companies, so that all parties involved in the industry can do their own jobs and focus on their main business, making the operation of social economy and financial payment services more efficient.
/ Big data accumulation and application:
- Third party payment platforms based on information technology systems can better record data and use them to infer consumer needs, helping merchants to conduct accurate marketing.
/ Improvement of residents' quality of life:
- Meet the needs of consumers for living, entertainment, learning and other payment needs.
- Reduce road congestion, thereby improving the convenience of travel for residents.
