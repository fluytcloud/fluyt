package com.fluytcloud.kubernetes.transport.mapper;

import java.util.List;

public interface Mapper<S, D> {

    D mapResponseList(S source);

    List<D> mapResponseList(List<S> sources);
}
