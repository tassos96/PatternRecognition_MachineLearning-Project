%Name: Anastasios Antonopoulos
%A.M:  1115201400014

function dataset = normalize_data(fh)
    Data = textscan(fh, ['%d,%[^,],',repmat('%f,',1,29),'%f\n']);
    fclose(fh);
    n = length(Data);       % number of features + target
    n = n-2;                % ignore first two attributes (ID, target)
    P = length(Data{1});    % number of patterns
    x = zeros(n,P);
    for pat=1:P
        for i=1:n
            x(i,pat) = double(Data{i+2}(pat));
        end
    end
    %Normalize our data to [0,1] range
    dataset = mat2gray(x);
end
