machine Intermediate(latch, operation_id) {
    constraints {
        col fixed latch = [1]*;
        col fixed operation_id = [0]*;
        col witness x;
        col intermediate = x;
        intermediate = intermediate;
    }
}