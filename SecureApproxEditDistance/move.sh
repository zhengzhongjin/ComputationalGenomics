for ((i = 0;i < 10;i++)) {
    cp process_data/a_$(($i + 40)) query_$i
}