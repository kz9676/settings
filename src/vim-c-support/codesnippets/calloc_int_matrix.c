
/*
 * ===  FUNCTION  ========================================================
 *         Name:  calloc_int_matrix
 *  Description:  Allocate a dynamic int-matrix of size rows*columns 
 *                and return a pointer.
 * =======================================================================
 */
int** calloc_int_matrix(int rows, int columns)
{
    int i;
    int** m;
    m = calloc(rows, sizeof(int*));             /* alloc pointer array  */
    assert(m != NULL);                          /* abort failed alloc   */
    m[0] = calloc(rows * columns, sizeof(int)); /* allocate data array  */
    assert(*m != NULL);                         /* abort failed alloc   */
    for (i = 1; i < rows; i += 1)               /* set pointers         */
        m[i] = m[i - 1] + columns;
    return m;
} /* End of function - calloc_int_matrix */

/*
 * ===  FUNCTION  ========================================================
 *         Name:  free_int_matrix
 *  Description:  Free a dynamic int-matrix.
 * =======================================================================
 */
int** free_int_matrix(int** m)
{
    free(*m); /* free data array            */
    free(m);  /* free pointer array         */
    return NULL;
} /* End of function - free_int_matrix */
