package com.fluytcloud.admin.transport.http;

import com.fluytcloud.admin.entities.exception.NotFoundException;
import com.fluytcloud.admin.interactors.CustomerPersistUseCase;
import com.fluytcloud.admin.interactors.CustomerService;
import com.fluytcloud.admin.transport.mapper.CustomerMapper;
import com.fluytcloud.admin.transport.request.CustomerRequest;
import io.quarkus.security.Authenticated;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/admin/customer")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class CustomerResource {

    private static final CustomerMapper CUSTOMER_MAPPER = new CustomerMapper();
    private final CustomerService customerService;
    private final CustomerPersistUseCase customerPersistUseCase;

    public CustomerResource(CustomerService customerService, CustomerPersistUseCase customerPersistUseCase) {
        this.customerService = customerService;
        this.customerPersistUseCase = customerPersistUseCase;
    }

    @GET
    @RolesAllowed("administrator")
    public Response findAll(@QueryParam("page") Integer page, @QueryParam("size") Integer size) {
        var pageable = customerService.findAll(PageRequest.of(page, size));
        var pagination = new PageImpl<>(
                pageable.getContent()
                        .stream()
                        .map(CUSTOMER_MAPPER::mapResponseList)
                        .toList(),
                pageable.getPageable(),
                pageable.getTotalElements()
        );
        return Response.ok(pagination).build();
    }

    @GET
    @Path("{id}")
    @RolesAllowed("administrator")
    public Response findById(@PathParam("id") Integer id) {
        var customer = customerService.findById(id)
                .map(CUSTOMER_MAPPER::mapResponse);
        return Response.ok(customer).build();
    }

    @POST
    @RolesAllowed("administrator")
    public Response create(CustomerRequest customerRequest) {
        var customer = CUSTOMER_MAPPER.map(customerRequest);
        customer = customerPersistUseCase.create(customer);
        return Response.ok(CUSTOMER_MAPPER.mapResponse(customer)).build();
    }

    @PATCH
    @RolesAllowed("administrator")
    @Path("{id}/active")
    public Response changeActive(@PathParam("id") Integer id){
        try {
            customerService.changeActive(id);
            return Response.noContent().build();
        } catch (NotFoundException e) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

}
