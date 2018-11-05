#Create a seperate dataframe for only chargedoff status
loan_chargedOff <- loan[loan$loan_status=="Charged Off",]
View(loan_chargedOff)

#Create a seperate dataframe for only full paid loan status
loan_Paid <- loan[loan$loan_status=="Fully Paid",]
View(loan_Paid)

#Create a seperate dataframe for only current loan status
loan_current <- loan[loan$loan_status=="Current",]
View(loan_current)


#Loan amount vs loan status vs loan grades
ggplot(loan, aes(x=loan$loan_status, y=loan$loan_amnt, fill=loan$grade))+ geom_bar(stat="identity")


#Loan amount respective state and total income resepctive to state
#different statuses of loans in different states
ggplot(loan, aes(x=loan$addr_state, fill=loan$loan_status))+geom_bar()
Observations: 
Highest loans are being taken from CA and lowest by IA and ID

#for charged off
ggplot(loan_chargedOff, aes(x=loan_chargedOff$addr_state, fill=loan_chargedOff$loan_status))+geom_bar()
Observations: 
Highest loans charged off are from CA and the rest of the data is proportionate to total status

ggplot(loan_Paid, aes(x=loan_Paid$addr_state, fill=loan_Paid$loan_status))+geom_bar()


#graph between state and loan amount and loan status
ggplot(loan, aes(x=loan$addr_state, y=loan$loan_amnt,fill=loan$loan_status))+geom_bar(stat="identity")

#plot with state vs loan amount with annual income and status as charged off
ggplot(loan_chargedOff, aes(x=loan_chargedOff$addr_state, y=loan_chargedOff$loan_amnt, size=loan_chargedOff$annual_inc))+geom_bar(stat="identity")

#plot with state vs loan amount with annual income and status as full paid
ggplot(loan_Paid, aes(x=loan_Paid$addr_state, y=loan_Paid$loan_amnt, size=loan_Paid$annual_inc))+geom_bar(stat="identity")


#Plot for loan amount vs loan status
ggplot(loan, aes(x=loan$loan_amnt, fill=loan$loan_status))+geom_histogram(position="dodge")
#for charged off
ggplot(loan_chargedOff, aes(x=loan_chargedOff$loan_amnt))+geom_point(stat="count")


#Loan amount vs home ownership
ggplot(loan, aes(x=loan$loan_status, fill=loan$home_ownership))+geom_bar(stat="count", position="dodge")
#for charged off
ggplot(loan_chargedOff, aes(x=loan_chargedOff$loan_status, fill=loan_chargedOff$home_ownership))+geom_bar(stat="count", position="dodge")
#Observation
People who take loans with rented houses will default more
#for paid
ggplot(loan_Paid, aes(x=loan_Paid$loan_status, fill=loan_Paid$home_ownership))+geom_bar(stat="count", position="dodge")



#plot with state vs loan amount with annual income and status as charged off
ggplot(loan_chargedOff, aes(x=loan_chargedOff$addr_state, y=loan_chargedOff$loan_amnt, col=loan_chargedOff$loan_status))+geom_point()

#Loan status vs annual income
ggplot(loan, aes(y=loan$annual_inc, x= loan$loan_status, col= loan$loan_status))+geom_point()
#charged off
ggplot(loan_chargedOff, aes(y=loan_chargedOff$annual_inc, x= loan_chargedOff$loan_status, col= loan_chargedOff$loan_status))+geom_point()
Observation:
Induviduals with annual income between 0 and 400000 are more in number for defaulting

#paid
ggplot(loan_Paid, aes(y=loan_Paid$annual_inc, x= loan_Paid$loan_status, col= loan_Paid$loan_status))+geom_point()


#Loan status vs late fee  
ggplot(loan, aes(x=loan$loan_status, y=loan$total_rec_late_fee, fill=loan$loan_status))+geom_bar(stat="identity")



#7.stats in grades
#for all the loans
ggplot(loan, aes(x=loan$grade, fill=loan$loan_status))+geom_bar()
#for charged off loans
ggplot(loan_chargedOff, aes(x=loan_chargedOff$grade, fill=loan_chargedOff$grade))+geom_bar()
#Observation:
grades B, C loans have high chance of getting defaulted

#for paid loans
ggplot(loan_Paid, aes(x=loan_Paid$grade, fill=loan_Paid$grade))+geom_bar()

#for current loans
ggplot(loan_current, aes(x=loan_current$grade))+geom_bar()

#Intrest rates among different loan status
ggplot(loan, aes(fill=loan$loan_status, x=loan$int_rate))+geom_histogram(position="dodge")
#Fully Pad loan
ggplot(loan_Paid, aes(x=loan_Paid$int_rate))+geom_bar()
#charged off loan
ggplot(loan_chargedOff, aes(x=loan_chargedOff$int_rate))+geom_bar()
#Observation
Loans with intr. rate between 12 to 15 have high chance of getting defaulted

#Term vs loan status
ggplot(loan,aes(fill=loan$loan_status, x=loan$term))+geom_histogram(position="dodge")
#chargedoff
ggplot(loan_chargedOff,aes(fill=loan_chargedOff$loan_status, x=loan_chargedOff$term))+geom_histogram()
#paid
ggplot(loan_Paid,aes(fill=loan_Paid$loan_status, x=loan_Paid$term))+geom_histogram()


#Aggregate values for number of loans charged off
#per state
loan$charged_off <- ifelse(loan1$loan_status=="Charged Off",1,0)
aggregate(loan$charged_off~loan$addr_state, FUN=sum)

#per grade
aggregate(loan1$charged_off~loan1$grade, FUN=sum)



#EXTRA 
ggplot(loan, aes(x=loan$loan_status, y=loan$loan_amnt, col=loan$grade, size=loan$int_rate, shape=loan$home_ownership))+ geom_point(stat="identity")
ggplot(loan, aes(size=loan$loan_status, x=loan$loan_amnt, col=loan$grade, y=loan$int_rate, shape=loan$home_ownership))+ geom_point(stat="identity")
