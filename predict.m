function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

X = [ones(m, 1), X];
Z = X * Theta1';						% Z dimension is m(5000)x25
H1 = 1 ./ (1 + exp(-Z));	
A2 =[ones(m, 1), H1];					% A2 dimension is mx(25+1)
A3 = A2 * Theta2';
H = 1 ./ (1 + exp(-A3));			    % H dimension is m*num_labels
for i = 1:m
	[x, ix] = max(H(i,:));
	p(i) = ix;							% p dimension is mx1
end
% =========================================================================

end
