%%
%create a dictionary for symbols

function PostArray=PostProb(testResult)

keySet = {':(',':)','+|:(','+|:)','-|:(','-|:)'};
valueSet = [0.001 0.999 0.99 0.05 1-0.99 1-0.05];
P = containers.Map(keySet,valueSet);
format long  %to get the result upto maximum decimal places for accuracy


for k =1:length(testResult)
    %marginal likelihoods
     P('+') = P('+|:)')*P(':)')+ P('+|:(')*P(':('); % the probability that the test result is positive
     P('-') = P('-|:)')*P(':)')+ P('-|:(')*P(':('); % the probability that the test result is negative

     
     %Posterior Probability
     P(':(|+')= P('+|:(')*P(':(')/P('+'); %the probability that the person has a disease when the test result is positive
     P(':(|-')= P('-|:(')*P(':(')/P('-'); %the probability that the person has a disease when the test result is negative
     P(':)|+')=P('+|:)')*P(':)')/P('+'); %the probability that the person is healthy when the test result is positive
     P(':)|-')=P('-|:)')*P(':)')/P('-'); %the probability that the person is healthy when the test result is negative
     
     %update Priors to posterior

      P(":(") = P(strcat(":(|",testResult(k)));
      P(":)") = 1.0 - P(":(");
      
end

PostArray= [P(":("),P(":)")];

end

